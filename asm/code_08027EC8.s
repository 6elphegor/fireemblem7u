	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08027EC8
sub_08027EC8: @ 0x08027EC8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _08027F14 @ =0x0202BBB8
	movs r0, #1
	ldrb r2, [r1, #4]
	orrs r0, r2
	strb r0, [r1, #4]
	ldr r0, _08027F18 @ =0x00000735
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r5, #0
	bl StartSubtitleHelp
	ldr r4, _08027F1C @ =0x03004690
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl IsCameraNotWatchingPosition
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08027F0C
	ldr r0, [r4]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	adds r0, r5, #0
	bl EnsureCameraOntoPosition
_08027F0C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08027F14: .4byte 0x0202BBB8
_08027F18: .4byte 0x00000735
_08027F1C: .4byte 0x03004690
