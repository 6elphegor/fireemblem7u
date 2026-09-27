	.include "macro.inc"

	.syntax unified

	thumb_func_start Text_DrawString
Text_DrawString: @ 0x08005718
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r0, _08005730 @ =0x02028D70
	ldr r0, [r0]
	ldrb r0, [r0, #0x16]
	cmp r0, #5
	beq _08005734
	adds r0, r6, #0
	bl sub_08005B60
	b _08005786
	.align 2, 0
_08005730: .4byte 0x02028D70
_08005734:
	ldrb r0, [r4]
	cmp r0, #1
	bls _08005786
_0800573A:
	ldrb r3, [r4]
	adds r4, #1
	cmp r3, #0x1f
	bls _08005780
	ldrb r2, [r4]
	adds r4, #1
	ldr r5, _0800575C @ =0x02028D70
_08005748:
	ldr r0, [r5]
	ldr r1, [r0, #4]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r1, _08005760 @ =0xFFFFFF00
	adds r0, r0, r1
	ldr r1, [r0]
	cmp r1, #0
	beq _08005780
	b _08005770
	.align 2, 0
_0800575C: .4byte 0x02028D70
_08005760: .4byte 0xFFFFFF00
_08005764:
	ldr r1, [r1]
	cmp r1, #0
	bne _08005770
	movs r3, #0x81
	movs r2, #0xa7
	b _08005748
_08005770:
	ldrb r0, [r1, #4]
	cmp r0, r3
	bne _08005764
	ldr r0, [r5]
	ldr r2, [r0, #8]
	adds r0, r6, #0
	bl _call_via_r2
_08005780:
	ldrb r1, [r4]
	cmp r1, #1
	bhi _0800573A
_08005786:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
