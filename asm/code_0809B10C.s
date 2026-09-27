	.include "macro.inc"

	.syntax unified

	thumb_func_start GetSupportClassForCharId
GetSupportClassForCharId: @ 0x0809B10C
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #1
_0809B112:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0809B140
	ldr r3, [r2]
	cmp r3, #0
	beq _0809B140
	ldr r0, [r2, #0xc]
	ldr r1, _0809B13C @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0809B140
	ldrb r0, [r3, #4]
	cmp r0, r5
	bne _0809B140
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	b _0809B152
	.align 2, 0
_0809B13C: .4byte 0x00010004
_0809B140:
	adds r4, #1
	cmp r4, #0x3f
	ble _0809B112
	ldr r2, _0809B158 @ =0x08BDCE4C
	subs r1, r5, #1
	movs r0, #0x34
	muls r0, r1, r0
	adds r0, r0, r2
	ldrb r0, [r0, #5]
_0809B152:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0809B158: .4byte 0x08BDCE4C
