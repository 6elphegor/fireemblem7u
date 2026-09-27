	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B4D14
sub_080B4D14: @ 0x080B4D14
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080B4D48 @ =0x08CE76C8
	bl Proc_Find
	adds r5, r0, #0
	ldr r1, [r5, #0x3c]
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r4, r0, #2
	adds r1, #0x30
	adds r1, r1, r4
	ldr r0, [r1]
	cmp r0, #0
	beq _080B4D36
	bl EndSpriteAnimProc
_080B4D36:
	ldr r0, [r5, #0x3c]
	adds r0, #0x30
	adds r0, r0, r4
	movs r1, #0
	str r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B4D48: .4byte 0x08CE76C8
