	.include "macro.inc"

	.syntax unified

	thumb_func_start UnitPromote
UnitPromote: @ 0x08029818
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldrb r0, [r0, #5]
	bl GetClassData
	adds r3, r0, #0
	adds r0, #0x22
	ldrb r1, [r4, #0x12]
	ldrb r0, [r0]
	adds r0, r1, r0
	strb r0, [r4, #0x12]
	lsls r0, r0, #0x18
	ldrb r2, [r3, #0x13]
	lsls r1, r2, #0x18
	cmp r0, r1
	ble _0802983C
	strb r2, [r4, #0x12]
_0802983C:
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r5, [r4, #0x14]
	ldrb r0, [r0]
	adds r0, r5, r0
	strb r0, [r4, #0x14]
	lsls r0, r0, #0x18
	ldrb r2, [r3, #0x14]
	lsls r1, r2, #0x18
	cmp r0, r1
	ble _08029854
	strb r2, [r4, #0x14]
_08029854:
	adds r0, r3, #0
	adds r0, #0x24
	ldrb r7, [r4, #0x15]
	ldrb r0, [r0]
	adds r0, r7, r0
	strb r0, [r4, #0x15]
	lsls r0, r0, #0x18
	ldrb r2, [r3, #0x15]
	lsls r1, r2, #0x18
	cmp r0, r1
	ble _0802986C
	strb r2, [r4, #0x15]
_0802986C:
	adds r0, r3, #0
	adds r0, #0x25
	ldrb r1, [r4, #0x16]
	ldrb r0, [r0]
	adds r0, r1, r0
	strb r0, [r4, #0x16]
	lsls r0, r0, #0x18
	ldrb r2, [r3, #0x16]
	lsls r1, r2, #0x18
	cmp r0, r1
	ble _08029884
	strb r2, [r4, #0x16]
_08029884:
	adds r0, r3, #0
	adds r0, #0x26
	ldrb r5, [r4, #0x17]
	ldrb r0, [r0]
	adds r0, r5, r0
	strb r0, [r4, #0x17]
	lsls r0, r0, #0x18
	ldrb r2, [r3, #0x17]
	lsls r1, r2, #0x18
	cmp r0, r1
	ble _0802989C
	strb r2, [r4, #0x17]
_0802989C:
	adds r0, r3, #0
	adds r0, #0x27
	ldrb r7, [r4, #0x18]
	ldrb r0, [r0]
	adds r0, r7, r0
	strb r0, [r4, #0x18]
	lsls r0, r0, #0x18
	ldrb r2, [r3, #0x18]
	lsls r1, r2, #0x18
	cmp r0, r1
	ble _080298B4
	strb r2, [r4, #0x18]
_080298B4:
	movs r2, #0
	adds r6, r4, #0
	adds r6, #0x28
	adds r5, r6, #0
_080298BC:
	adds r0, r5, r2
	ldr r1, [r4, #4]
	adds r1, #0x2c
	adds r1, r1, r2
	ldrb r7, [r0]
	ldrb r1, [r1]
	subs r1, r7, r1
	strb r1, [r0]
	adds r2, #1
	cmp r2, #7
	ble _080298BC
	str r3, [r4, #4]
	movs r2, #0
	adds r3, r6, #0
_080298D8:
	adds r1, r3, r2
	ldr r0, [r4, #4]
	adds r0, #0x2c
	adds r0, r0, r2
	ldrb r0, [r0]
	ldrb r5, [r1]
	adds r0, r0, r5
	cmp r0, #0xfb
	ble _080298EC
	movs r0, #0xfb
_080298EC:
	strb r0, [r1]
	adds r2, #1
	cmp r2, #7
	ble _080298D8
	movs r1, #0
	movs r0, #1
	strb r0, [r4, #8]
	strb r1, [r4, #9]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
