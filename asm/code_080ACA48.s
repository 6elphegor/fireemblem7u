	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080ACA48
sub_080ACA48: @ 0x080ACA48
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x58]
	cmp r0, #0
	blt _080ACA80
	ldr r3, _080ACA88 @ =0x08CE4158
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #0x38
	movs r2, #8
	bl PutSpriteExt
	ldr r1, _080ACA8C @ =0x08CE456C
	ldr r0, [r4, #0x58]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #0x40
	movs r2, #0x10
	bl PutSpriteExt
_080ACA80:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ACA88: .4byte 0x08CE4158
_080ACA8C: .4byte 0x08CE456C
