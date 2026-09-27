	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08055E30
sub_08055E30: @ 0x08055E30
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08055E5C @ =0x0202BBB8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r3, _08055E60 @ =0x0201FB24
	ldr r2, _08055E64 @ =0x0201FDB0
	cmp r0, #0
	beq _08055EA8
	ldr r0, [r4, #0x48]
	cmp r0, #2
	bne _08055E78
	ldr r1, _08055E68 @ =0x0201FB20
	ldr r0, [r1]
	cmp r0, #1
	bne _08055E70
	movs r0, #0
	str r0, [r1]
	ldr r0, _08055E6C @ =0x0201FB2C
	b _08055E76
	.align 2, 0
_08055E5C: .4byte 0x0202BBB8
_08055E60: .4byte 0x0201FB24
_08055E64: .4byte 0x0201FDB0
_08055E68: .4byte 0x0201FB20
_08055E6C: .4byte 0x0201FB2C
_08055E70:
	movs r0, #1
	str r0, [r1]
	ldr r0, _08055E8C @ =0x0201FC6C
_08055E76:
	str r0, [r3]
_08055E78:
	ldr r1, _08055E90 @ =0x0201FDAC
	ldr r0, [r1]
	cmp r0, #1
	bne _08055E9C
	movs r0, #0
	str r0, [r1]
	ldr r1, _08055E94 @ =0x0201FDB0
	ldr r0, _08055E98 @ =0x0201FDB8
	b _08055EA4
	.align 2, 0
_08055E8C: .4byte 0x0201FC6C
_08055E90: .4byte 0x0201FDAC
_08055E94: .4byte 0x0201FDB0
_08055E98: .4byte 0x0201FDB8
_08055E9C:
	movs r0, #1
	str r0, [r1]
	ldr r1, _08055EDC @ =0x0201FDB0
	ldr r0, _08055EE0 @ =0x0201FEF8
_08055EA4:
	str r0, [r1]
	adds r2, r1, #0
_08055EA8:
	ldr r1, _08055EE4 @ =0x0201FB28
	ldr r0, [r3]
	str r0, [r1]
	ldr r1, _08055EE8 @ =0x0201FDB4
	ldr r0, [r2]
	str r0, [r1]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r4, #0x44]
	cmp r0, r1
	bne _08055EFC
	ldr r0, _08055EEC @ =0x0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	bl CheckInEkrDragon
	cmp r0, #0
	bne _08055EF0
	movs r0, #0
	bl SetOnHBlankA
	b _08055EF6
	.align 2, 0
_08055EDC: .4byte 0x0201FDB0
_08055EE0: .4byte 0x0201FEF8
_08055EE4: .4byte 0x0201FB28
_08055EE8: .4byte 0x0201FDB4
_08055EEC: .4byte 0x0201774C
_08055EF0:
	ldr r0, _08055F04 @ =sub_08055CA8
	bl SetOnHBlankA
_08055EF6:
	adds r0, r4, #0
	bl Proc_Break
_08055EFC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08055F04: .4byte sub_08055CA8
