	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_LowerBgmVolume
EvtCmd_LowerBgmVolume: @ 0x0800E4A8
	push {lr}
	adds r3, r0, #0
	adds r1, r3, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800E4CA
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #0x90
	movs r2, #0xa
	bl StartBgmVolumeChange
	movs r0, #2
	b _0800E4CC
_0800E4CA:
	movs r0, #0
_0800E4CC:
	pop {r1}
	bx r1
