	.include "macro.inc"

	.syntax unified

	thumb_func_start GetUnitItemCostSum
GetUnitItemCostSum: @ 0x080170A0
	push {r4, r5, r6, r7, lr}
	movs r5, #0
	movs r4, #1
_080170A6:
	adds r0, r4, #0
	bl GetUnit
	mov ip, r0
	adds r6, r4, #1
	cmp r0, #0
	beq _08017110
	ldr r0, [r0]
	cmp r0, #0
	beq _08017110
	mov r1, ip
	ldr r0, [r1, #0xc]
	ldr r1, _080170EC @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _08017110
	movs r4, #0
	mov r0, ip
	ldrh r3, [r0, #0x1e]
	cmp r3, #0
	beq _08017110
	ldr r7, _080170F0 @ =0x08BE222C
_080170D2:
	movs r1, #0xff
	ands r1, r3
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, r0, r7
	ldr r0, [r2, #8]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _080170F4
	ldrh r0, [r2, #0x1a]
	b _080170FA
	.align 2, 0
_080170EC: .4byte 0x00010004
_080170F0: .4byte 0x08BE222C
_080170F4:
	asrs r0, r3, #8
	ldrh r2, [r2, #0x1a]
	muls r0, r2, r0
_080170FA:
	adds r5, r5, r0
	adds r4, #1
	cmp r4, #4
	bgt _08017110
	lsls r1, r4, #1
	mov r0, ip
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r3, [r0]
	cmp r3, #0
	bne _080170D2
_08017110:
	adds r4, r6, #0
	cmp r4, #0x3f
	ble _080170A6
	adds r0, r5, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
