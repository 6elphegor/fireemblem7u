	.include "macro.inc"

	.syntax unified

	thumb_func_start PlaySeSpacial
PlaySeSpacial: @ 0x08014D80
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r0, _08014DD0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08014D9A
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	bl m4aSongNumStart
_08014D9A:
	ldr r2, _08014DD4 @ =0x0869D668
	ldr r0, _08014DD8 @ =0x0869D6E0
	lsls r1, r4, #3
	adds r1, r1, r0
	ldrh r3, [r1, #4]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r4, [r0]
	adds r0, r4, #0
	bl m4aMPlayImmInit
	ldr r5, _08014DDC @ =0x0000FFFF
	adds r0, r6, #0
	bl Screen2Pan
	adds r2, r0, #0
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl MPlayPanpotControl
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08014DD0: .4byte 0x0202BBF8
_08014DD4: .4byte 0x0869D668
_08014DD8: .4byte 0x0869D6E0
_08014DDC: .4byte 0x0000FFFF
