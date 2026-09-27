	.include "macro.inc"

	.syntax unified

	thumb_func_start DrawMenuButtonAt
DrawMenuButtonAt: @ 0x08086420
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _080864A0 @ =0x000001FF
	mov r8, r0
	adds r1, r4, #0
	ands r1, r0
	movs r0, #0xff
	ands r5, r0
	ldr r6, _080864A4 @ =0x08B905F8
	movs r0, #0xa0
	lsls r0, r0, #2
	str r0, [sp]
	movs r0, #4
	adds r2, r5, #0
	adds r3, r6, #0
	bl PutSprite
	adds r1, r4, #0
	adds r1, #0x20
	mov r0, r8
	ands r1, r0
	movs r0, #0xa1
	lsls r0, r0, #2
	str r0, [sp]
	movs r0, #4
	adds r2, r5, #0
	adds r3, r6, #0
	bl PutSprite
	adds r1, r4, #0
	adds r1, #0x40
	mov r0, r8
	ands r1, r0
	movs r0, #0xa2
	lsls r0, r0, #2
	str r0, [sp]
	movs r0, #4
	adds r2, r5, #0
	adds r3, r6, #0
	bl PutSprite
	adds r4, #0x60
	mov r0, r8
	ands r4, r0
	ldr r3, _080864A8 @ =0x08B905D0
	movs r0, #0xa3
	lsls r0, r0, #2
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	adds r2, r5, #0
	bl PutSprite
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080864A0: .4byte 0x000001FF
_080864A4: .4byte 0x08B905F8
_080864A8: .4byte 0x08B905D0
