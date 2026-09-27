	.include "macro.inc"

	.syntax unified

	thumb_func_start GetUnitStaffReachBits
GetUnitStaffReachBits: @ 0x08016FCC
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r6, #0
	movs r5, #0
	ldrh r4, [r7, #0x1e]
	cmp r4, #0
	beq _0801701C
_08016FDA:
	adds r0, r7, #0
	adds r1, r4, #0
	bl CanUnitUseStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08017008
	movs r0, #0xff
	ands r0, r4
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _0801702C @ =0x08BE222C
	adds r1, r1, r0
	movs r4, #0xf
	ldrb r1, [r1, #0x19]
	ands r4, r1
	cmp r4, #0
	bne _08017002
	movs r4, #0x63
_08017002:
	cmp r6, r4
	bge _08017008
	adds r6, r4, #0
_08017008:
	adds r5, #1
	cmp r5, #4
	bgt _0801701C
	lsls r1, r5, #1
	adds r0, r7, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _08016FDA
_0801701C:
	cmp r6, #2
	beq _0801703A
	cmp r6, #2
	bgt _08017030
	cmp r6, #1
	beq _08017036
	b _08017042
	.align 2, 0
_0801702C: .4byte 0x08BE222C
_08017030:
	cmp r6, #0x63
	beq _0801703E
	b _08017042
_08017036:
	movs r0, #1
	b _08017044
_0801703A:
	movs r0, #3
	b _08017044
_0801703E:
	movs r0, #0x20
	b _08017044
_08017042:
	movs r0, #0
_08017044:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
