	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080401EC
sub_080401EC: @ 0x080401EC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_080490D4
	ldr r0, _08040228 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08040222
	ldr r2, _0804022C @ =0x0869D668
	ldr r1, _08040230 @ =0x0869D6E0
	ldr r0, _08040234 @ =0x0000040C
	adds r1, r1, r0
	ldrh r3, [r1]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	movs r1, #1
	bl m4aMPlayFadeOut
	adds r0, r4, #0
	bl Proc_Break
_08040222:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08040228: .4byte 0x08B857F8
_0804022C: .4byte 0x0869D668
_08040230: .4byte 0x0869D6E0
_08040234: .4byte 0x0000040C
