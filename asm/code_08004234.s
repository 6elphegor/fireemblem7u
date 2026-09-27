	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08004234
sub_08004234: @ 0x08004234
	push {r7, lr}
	mov r7, sp
	bl sub_0800421C
	ldr r1, _08004270 @ =0x03005B10
	adds r0, r1, #0
	movs r1, #1
	bl m4aMPlayFadeOut
	ldr r1, _08004274 @ =0x03005D20
	adds r0, r1, #0
	movs r1, #1
	bl m4aMPlayFadeOut
	ldr r0, _08004278 @ =0x02024E1C
	ldrh r1, [r0, #2]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #2]
	ldr r0, _08004278 @ =0x02024E1C
	ldrh r1, [r0, #4]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #4]
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08004270: .4byte 0x03005B10
_08004274: .4byte 0x03005D20
_08004278: .4byte 0x02024E1C
