	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_RestoreBgmVolume
EvtCmd_RestoreBgmVolume: @ 0x0800E4D0
	push {lr}
	adds r3, r0, #0
	adds r1, r3, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800E4F2
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x90
	movs r2, #0xa
	bl StartBgmVolumeChange
	movs r0, #2
	b _0800E4FC
_0800E4F2:
	movs r0, #0x80
	lsls r0, r0, #1
	bl SetBgmVolume
	movs r0, #0
_0800E4FC:
	pop {r1}
	bx r1
