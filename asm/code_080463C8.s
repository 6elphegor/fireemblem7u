	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080463C8
sub_080463C8: @ 0x080463C8
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r4, _080463EC @ =0x0300141C
	ldr r2, _080463F0 @ =sub_080463B4
	adds r0, r4, #0
	add r1, sp, #4
	bl SioReceiveData
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08046454
	ldrb r0, [r4]
	cmp r0, #2
	beq _080463F4
	cmp r0, #3
	beq _08046438
	b _08046454
	.align 2, 0
_080463EC: .4byte 0x0300141C
_080463F0: .4byte sub_080463B4
_080463F4:
	ldrb r0, [r4, #2]
	bl GetUnit
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08046418
	ldr r0, _08046414 @ =0x03001420
	ldr r0, [r0]
	bl EndMu
	b _08046420
	.align 2, 0
_08046414: .4byte 0x03001420
_08046418:
	ldr r0, [r5, #0x2c]
	strb r0, [r4, #0x10]
	ldr r0, [r5, #0x30]
	strb r0, [r4, #0x11]
_08046420:
	ldr r0, [r4, #0xc]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0xc]
	bl RefreshUnitSprites
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
	b _08046454
_08046438:
	ldrb r0, [r4, #1]
	ldr r2, _08046460 @ =0x0203DCA1
	adds r3, r5, #0
	adds r3, #0x34
	adds r1, r5, #0
	adds r1, #0x38
	str r1, [sp]
	movs r1, #1
	bl sub_08044C10
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
_08046454:
	bl sub_080462A4
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08046460: .4byte 0x0203DCA1
