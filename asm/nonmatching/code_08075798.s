	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08075798
sub_08075798: @ 0x08075798
	push {r4, r7, lr}
	mov r7, sp
	ldr r0, _080757D0 @ =0x000002D5
	ldr r1, _080757D4 @ =0x0203E0FC
	ldr r3, _080757D4 @ =0x0203E0FC
	adds r2, r3, #0
	adds r3, #0x58
	ldrb r2, [r3]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, _080757D8 @ =0x0202BBB8
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	subs r1, r1, r3
	bl PlaySeSpacial
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080757D0: .4byte 0x000002D5
_080757D4: .4byte 0x0203E0FC
_080757D8: .4byte 0x0202BBB8
