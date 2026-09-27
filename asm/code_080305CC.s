	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080305CC
sub_080305CC: @ 0x080305CC
	push {r4, r5, lr}
	sub sp, #4
	ldr r4, _08030650 @ =0x08B905F8
	ldr r0, _08030654 @ =0x0000038D
	str r0, [sp]
	movs r0, #4
	movs r1, #0x68
	movs r2, #0x8c
	adds r3, r4, #0
	bl PutSprite
	ldr r0, _08030658 @ =0x00000391
	str r0, [sp]
	movs r0, #4
	movs r1, #0x88
	movs r2, #0x8c
	adds r3, r4, #0
	bl PutSprite
	ldr r3, _0803065C @ =0x08B905B8
	ldr r0, _08030660 @ =0x00000395
	str r0, [sp]
	movs r0, #4
	movs r1, #0xa8
	movs r2, #0x8c
	bl PutSprite
	ldr r5, _08030664 @ =0x08B905D0
	movs r0, #0xe0
	lsls r0, r0, #2
	str r0, [sp]
	movs r0, #4
	movs r1, #0x10
	movs r2, #0x8c
	adds r3, r5, #0
	bl PutSprite
	ldr r0, _08030668 @ =0x00000397
	str r0, [sp]
	movs r0, #4
	movs r1, #0x18
	movs r2, #0x8c
	adds r3, r4, #0
	bl PutSprite
	ldr r0, _0803066C @ =0x0000039B
	str r0, [sp]
	movs r0, #4
	movs r1, #0x38
	movs r2, #0x8c
	adds r3, r4, #0
	bl PutSprite
	ldr r0, _08030670 @ =0x0000039F
	str r0, [sp]
	movs r0, #4
	movs r1, #0x58
	movs r2, #0x8c
	adds r3, r5, #0
	bl PutSprite
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08030650: .4byte 0x08B905F8
_08030654: .4byte 0x0000038D
_08030658: .4byte 0x00000391
_0803065C: .4byte 0x08B905B8
_08030660: .4byte 0x00000395
_08030664: .4byte 0x08B905D0
_08030668: .4byte 0x00000397
_0803066C: .4byte 0x0000039B
_08030670: .4byte 0x0000039F
