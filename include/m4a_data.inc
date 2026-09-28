@ Macros for m4a (MusicPlayer2000) data: voice groups, the song table and
@ the music player table.  Used by the files tools/m4adis.py extracts to
@ sound/.  Voice macro names and arguments follow pret's music_voice.inc.

@ ToneData (12 bytes): type, key, length, pan_sweep, wav, attack, decay,
@ sustain, release.

	.macro voice_directsound base_midi_key, pan, sample_data_pointer, attack, decay, sustain, release
	.byte 0
	_voice_directsound \base_midi_key, \pan, \sample_data_pointer, \attack, \decay, \sustain, \release
	.endm

	.macro voice_directsound_no_resample base_midi_key, pan, sample_data_pointer, attack, decay, sustain, release
	.byte 8
	_voice_directsound \base_midi_key, \pan, \sample_data_pointer, \attack, \decay, \sustain, \release
	.endm

	.macro voice_directsound_alt base_midi_key, pan, sample_data_pointer, attack, decay, sustain, release
	.byte 16
	_voice_directsound \base_midi_key, \pan, \sample_data_pointer, \attack, \decay, \sustain, \release
	.endm

	.macro _voice_directsound base_midi_key, pan, sample_data_pointer, attack, decay, sustain, release
	.byte \base_midi_key
	.byte 0
	.if \pan != 0
	.byte (0x80 | \pan)
	.else
	.byte 0
	.endif
	.4byte \sample_data_pointer
	.byte \attack
	.byte \decay
	.byte \sustain
	.byte \release
	.endm

	.macro voice_square_1 sweep, duty_cycle, attack, decay, sustain, release
	_voice_square_1 1, \sweep, \duty_cycle, \attack, \decay, \sustain, \release
	.endm

	.macro voice_square_1_alt sweep, duty_cycle, attack, decay, sustain, release
	_voice_square_1 9, \sweep, \duty_cycle, \attack, \decay, \sustain, \release
	.endm

	.macro _voice_square_1 type, sweep, duty_cycle, attack, decay, sustain, release
	.byte \type, 60, 0
	.byte \sweep
	.byte (\duty_cycle & 0x3)
	.byte 0, 0, 0
	.byte (\attack  & 0x7)
	.byte (\decay   & 0x7)
	.byte (\sustain & 0xF)
	.byte (\release & 0x7)
	.endm

	.macro voice_square_2 duty_cycle, attack, decay, sustain, release
	_voice_square_2 2, \duty_cycle, \attack, \decay, \sustain, \release
	.endm

	.macro voice_square_2_alt duty_cycle, attack, decay, sustain, release
	_voice_square_2 10, \duty_cycle, \attack, \decay, \sustain, \release
	.endm

	.macro _voice_square_2 type, duty_cycle, attack, decay, sustain, release
	.byte \type, 60, 0, 0
	.byte (\duty_cycle & 0x3)
	.byte 0, 0, 0
	.byte (\attack  & 0x7)
	.byte (\decay   & 0x7)
	.byte (\sustain & 0xF)
	.byte (\release & 0x7)
	.endm

	.macro voice_programmable_wave wave_samples_pointer, attack, decay, sustain, release
	_voice_programmable_wave 3, \wave_samples_pointer, \attack, \decay, \sustain, \release
	.endm

	.macro voice_programmable_wave_alt wave_samples_pointer, attack, decay, sustain, release
	_voice_programmable_wave 11, \wave_samples_pointer, \attack, \decay, \sustain, \release
	.endm

	.macro _voice_programmable_wave type, wave_samples_pointer, attack, decay, sustain, release
	.byte \type, 60, 0, 0
	.4byte \wave_samples_pointer
	.byte (\attack  & 0x7)
	.byte (\decay   & 0x7)
	.byte (\sustain & 0xF)
	.byte (\release & 0x7)
	.endm

	@ pan goes in the length byte, unk in pan_sweep (as in pret)
	.macro voice_noise base_midi_key, pan, unk, period, attack, decay, sustain, release
	_voice_noise 4, \base_midi_key, \pan, \unk, \period, \attack, \decay, \sustain, \release
	.endm

	.macro voice_noise_alt base_midi_key, pan, unk, period, attack, decay, sustain, release
	_voice_noise 12, \base_midi_key, \pan, \unk, \period, \attack, \decay, \sustain, \release
	.endm

	.macro _voice_noise type, base_midi_key, pan, unk, period, attack, decay, sustain, release
	.byte \type
	.byte \base_midi_key
	.if \pan != 0
	.byte (0x80 | \pan)
	.else
	.byte 0
	.endif
	.byte \unk
	.byte (\period & 0x1)
	.byte 0, 0, 0
	.byte (\attack  & 0x7)
	.byte (\decay   & 0x7)
	.byte (\sustain & 0xF)
	.byte (\release & 0x7)
	.endm

	@ key split: the table is indexed by MIDI key, so its pointer may point
	@ before the table's first byte
	.macro voice_keysplit voice_group_pointer, keysplit_table_pointer
	.byte 0x40, 0, 0, 0
	.4byte \voice_group_pointer
	.4byte \keysplit_table_pointer
	.endm

	@ drum set: every key selects its own entry of the voice group
	.macro voice_keysplit_all voice_group_pointer
	.byte 0x80, 0, 0, 0
	.4byte \voice_group_pointer
	.4byte 0
	.endm

@ struct Song: header, music player (twice: ms, me)
	.macro song label, ms, me
	.4byte \label
	.2byte \ms
	.2byte \me
	.endm

@ struct MusicPlayer: info, tracks, track count, (pad), unk_A
	.macro music_player info, track, ntracks, unk
	.4byte \info
	.4byte \track
	.byte \ntracks, 0
	.2byte \unk
	.endm
