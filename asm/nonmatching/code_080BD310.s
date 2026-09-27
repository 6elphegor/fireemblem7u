	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BD310
sub_080BD310: @ 0x080BD310
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #8
	adds r4, r0, #0
	ldr r6, _080BD360 @ =0x086740B4
	movs r0, #0x36
	ldrsh r1, [r4, r0]
	movs r0, #0x3e
	ldrsh r2, [r4, r0]
	movs r0, #0xe6
	lsls r0, r0, #6
	mov r8, r0
	movs r0, #5
	str r0, [sp]
	movs r5, #0xa
	str r5, [sp, #4]
	adds r0, r6, #0
	mov r3, r8
	bl StartSpriteAnimProc
	str r0, [r4, #0x2c]
	movs r0, #0x3a
	ldrsh r1, [r4, r0]
	ldr r2, [r4, #0x40]
	asrs r2, r2, #0x10
	movs r0, #6
	str r0, [sp]
	str r5, [sp, #4]
	adds r0, r6, #0
	mov r3, r8
	bl StartSpriteAnimProc
	str r0, [r4, #0x30]
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BD360: .4byte 0x086740B4
