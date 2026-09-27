	.include "macro.inc"

	.syntax unified

	thumb_func_start UnitInitFromDefinition
UnitInitFromDefinition: @ 0x08017868
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldrb r1, [r6]
	cmp r1, #0
	bgt _08017878
	movs r1, #0
	b _08017880
_08017878:
	movs r0, #0x34
	muls r1, r0, r1
	ldr r0, _08017890 @ =0x08BDCE18
	adds r1, r1, r0
_08017880:
	str r1, [r5]
	ldrb r0, [r6, #1]
	cmp r0, #0
	beq _08017894
	adds r1, r0, #0
	cmp r1, #0
	ble _0801789A
	b _0801789E
	.align 2, 0
_08017890: .4byte 0x08BDCE18
_08017894:
	ldrb r1, [r1, #5]
	cmp r1, #0
	bgt _0801789E
_0801789A:
	movs r1, #0
	b _080178A6
_0801789E:
	movs r0, #0x54
	muls r1, r0, r1
	ldr r0, _080178F0 @ =0x08BE015C
	adds r1, r1, r0
_080178A6:
	str r1, [r5, #4]
	ldrb r1, [r6, #3]
	lsrs r0, r1, #3
	strb r0, [r5, #8]
	ldrb r0, [r6, #6]
	strb r0, [r5, #0x10]
	ldrb r0, [r6, #7]
	strb r0, [r5, #0x11]
	adds r1, r6, #0
	adds r1, #8
	ldrb r0, [r6, #8]
	cmp r0, #0
	beq _080178E0
	adds r4, r1, #0
	adds r7, r4, #0
_080178C4:
	ldrb r0, [r4]
	bl MakeNewItem
	adds r1, r0, #0
	adds r0, r5, #0
	bl UnitAddItem
	adds r4, #1
	adds r0, r7, #3
	cmp r4, r0
	bgt _080178E0
	ldrb r0, [r4]
	cmp r0, #0
	bne _080178C4
_080178E0:
	adds r0, r5, #0
	adds r1, r6, #0
	bl CharStoreAI
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080178F0: .4byte 0x08BE015C
