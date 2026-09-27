	.include "macro.inc"

	.syntax unified

	thumb_func_start DisplayBmTextShadow
DisplayBmTextShadow: @ 0x08015A5C
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	bl GetGameTime
	lsrs r0, r0, #1
	movs r1, #0xf
	ands r0, r1
	movs r2, #2
	ldr r1, _08015A8C @ =0x08B92DB0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	str r2, [sp]
	movs r0, #4
	adds r1, r4, #0
	adds r2, r5, #0
	bl PutSprite
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08015A8C: .4byte 0x08B92DB0
