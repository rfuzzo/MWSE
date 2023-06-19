
#include "TES3AudioController.h"

#include "TES3WorldController.h"

#include "LuaManager.h"
#include "LuaMusicChangeTrackEvent.h"

namespace TES3 {
	const auto TES3_AudioController_changeMusicTrack = reinterpret_cast<void(__thiscall*)(AudioController*, const char*, int, float)>(0x403AC0);
	void AudioController::changeMusicTrack(const char* _filename, int crossfadeMillis, float volume) {
		std::string filename = _filename;

		if (mwse::lua::event::MusicChangeTrackEvent::getEventEnabled()) {
			auto stateHandle = mwse::lua::LuaManager::getInstance().getThreadSafeStateHandle();
			sol::table eventData = stateHandle.triggerEvent(new mwse::lua::event::MusicChangeTrackEvent(_filename, volume, crossfadeMillis, (int)WorldController::get()->musicSituation));
			if (eventData.valid()) {
				sol::optional<std::string> musicPath = eventData["music"];
				if (musicPath) {
					filename = std::move(musicPath.value());
				}
				crossfadeMillis = eventData.get_or("crossfade", crossfadeMillis);
				volume = eventData.get_or("volume", volume);
			}
			mwse::lua::event::MusicChangeTrackEvent::ms_Context = "invalid";
		}

		TES3_AudioController_changeMusicTrack(this, filename.c_str(), crossfadeMillis, volume);
	}

	const auto TES3_AudioController_setMusicVolume = reinterpret_cast<void(__thiscall*)(AudioController*, float)>(0x403A10);
	void AudioController::setMusicVolume(float volume) {
		TES3_AudioController_setMusicVolume(this, volume);
	}

	float AudioController::getMixVolume(AudioMixType mix) {
		float volume = 0.004f * volumeMaster;
		switch (mix) {
		case AudioMixType::Master:
			break;
		case AudioMixType::Voice:
			volume *= 0.004f * volumeVoice;
			break;
		case AudioMixType::Effects:
			volume *= 0.004f * volumeEffects;
			break;
		case AudioMixType::Footsteps:
			volume *= 0.004f * volumeFootsteps;
			break;
		case AudioMixType::Music:
			// Music is not linked to master volume
			volume = volumeMusic;
			break;
		}
		return volume;
	}

	float AudioController::getNormalizedMasterVolume() {
		return 0.004f * volumeMaster;
	}

	void AudioController::setNormalizedMasterVolume(float value) {
		volumeMaster = uint8_t(std::clamp(value, 0.0f, 1.0f) * 250);
		adjustLoopingSoundsVolume();
	}

	float AudioController::getNormalizedEffectsVolume() {
		return 0.004f * volumeEffects;
	}

	void AudioController::setNormalizedEffectsVolume(float value) {
		volumeEffects = uint8_t(std::clamp(value, 0.0f, 1.0f) * 250);
		adjustLoopingSoundsVolume();
	}

	float AudioController::getNormalizedVoiceVolume() {
		return 0.004f * volumeVoice;
	}

	void AudioController::setNormalizedVoiceVolume(float value) {
		volumeVoice = uint8_t(std::clamp(value, 0.0f, 1.0f) * 250);
	}

	float AudioController::getNormalizedFootstepsVolume() {
		return 0.004f * volumeFootsteps;
	}

	void AudioController::setNormalizedFootstepsVolume(float value) {
		volumeFootsteps = uint8_t(std::clamp(value, 0.0f, 1.0f) * 250);
	}

	float AudioController::getMusicVolume() {
		return volumeMusic;
	}

	const char* AudioController::getCurrentMusicFilePath() {
		return currentMusicFilePath;
	}

	void AudioController::setCurrentMusicFilePath(const char* path) {
		size_t newLength = strlen(path) + 1;
		if (newLength > 260) {
			throw std::invalid_argument("Given path is longer than 260 characters.");
		}

		strncpy_s(currentMusicFilePath, path, newLength);
	}

	const char* AudioController::getNextMusicFilePath() {
		return nextMusicFilePath;
	}

	void AudioController::setNextMusicFilePath(const char* path) {
		size_t newLength = strlen(path) + 1;
		if (newLength > 260) {
			throw std::invalid_argument("Given path is longer than 260 characters.");
		}

		strncpy_s(nextMusicFilePath, path, newLength);
	}

	double AudioController::getMusicDuration() {
		IMediaPosition * positioning;
		if (musicGraph->QueryInterface(IID_IMediaPosition, (LPVOID*)&positioning) < 0) {
			throw std::runtime_error("Music Error: Could not query IMediaPosition interface.");
		}

		REFTIME duration;
		if (positioning->get_Duration(&duration) < 0) {
			positioning->Release();
			throw std::runtime_error("Music Error: Could not fetch media duration.");
		}

		positioning->Release();
		return duration;
	}

	double AudioController::getMusicPosition() {
		IMediaPosition * positioning;
		if (musicGraph->QueryInterface(IID_IMediaPosition, (LPVOID*)&positioning) < 0) {
			throw std::runtime_error("Music Error: Could not query IMediaPosition interface.");
		}

		REFTIME position;
		if (positioning->get_CurrentPosition(&position) < 0) {
			positioning->Release();
			throw std::runtime_error("Music Error: Could not fetch media position.");
		}

		positioning->Release();
		return position;
	}

	void AudioController::setMusicPosition(double position) {
		if (position < 0.0) {
			position = 0.0;
		}

		IMediaPosition * positioning;
		if (musicGraph->QueryInterface(IID_IMediaPosition, (LPVOID*)&positioning) < 0) {
			throw std::runtime_error("Music Error: Could not query IMediaPosition interface.");
		}

		REFTIME duration;
		if (positioning->get_Duration(&duration) < 0) {
			positioning->Release();
			throw std::runtime_error("Music Error: Could not fetch media duration.");
		}

		if (position > duration) {
			positioning->Release();
			return;
		}

		if (positioning->put_CurrentPosition(position) < 0) {
			positioning->Release();
			throw std::runtime_error("Music Error: Failed to put current media position.");
		}

		positioning->Release();
	}

	void AudioController::changeMusicTrack_lua(const char* filename, sol::optional<int> crossfade, sol::optional<float> volume) {
		mwse::lua::event::MusicChangeTrackEvent::ms_Context = "lua";
		WorldController::get()->musicSituation = MusicSituation::Uninterruptible;
		changeMusicTrack(filename, crossfade.value_or(1000), volume.value_or(1.0f));
	}

	const auto TES3_AdjustLoopingSoundsVolume = reinterpret_cast<void(__cdecl*)()>(0x5A1E10);
	void __cdecl AudioController::adjustLoopingSoundsVolume() {
		TES3_AdjustLoopingSoundsVolume();
	}

	const auto TES3_AudioController_SetSoundBufferVolume = reinterpret_cast<void(__thiscall*)(AudioController*, SoundBuffer*, unsigned char)>(0x4029F0);
	void AudioController::setSoundBufferVolume(SoundBuffer* soundBuffer, unsigned char volume) {
		TES3_AudioController_SetSoundBufferVolume(this, soundBuffer, volume);
	}

}