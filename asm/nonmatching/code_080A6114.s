	.include "macro.inc"

	.syntax unified

	thumb_func_start SaveMenuModifySaveSlot
SaveMenuModifySaveSlot: @ 0x080A6114
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	cmp r2, #0
	ble _080A6152
	movs r5, #0
	lsls r6, r1, #0x18
_080A6128:
	adds r0, r4, #0
	bl IsSaveValid
	lsls r0, r0, #0x18
	cmp r0, r6
	beq _080A614E
	cmp r4, #2
	bne _080A613C
	movs r4, #0
	b _080A6142
_080A613C:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_080A6142:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _080A6128
	b _080A617A
_080A614E:
	adds r0, r4, #0
	b _080A617C
_080A6152:
	movs r5, #0
	lsls r6, r1, #0x18
_080A6156:
	adds r0, r4, #0
	bl IsSaveValid
	lsls r0, r0, #0x18
	cmp r0, r6
	beq _080A614E
	cmp r4, #0
	bne _080A616A
	movs r4, #2
	b _080A6170
_080A616A:
	subs r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_080A6170:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _080A6156
_080A617A:
	movs r0, #0xff
_080A617C:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
