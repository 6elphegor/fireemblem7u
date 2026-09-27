	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080757DC
sub_080757DC: @ 0x080757DC
	push {r4, r7, lr}
	mov r7, sp
	ldr r0, _08075814 @ =0x000002D6
	ldr r1, _08075818 @ =0x0203E0FC
	ldr r3, _08075818 @ =0x0203E0FC
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
	ldr r2, _0807581C @ =0x0202BBB8
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	subs r1, r1, r3
	bl PlaySeSpacial
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075814: .4byte 0x000002D6
_08075818: .4byte 0x0203E0FC
_0807581C: .4byte 0x0202BBB8
