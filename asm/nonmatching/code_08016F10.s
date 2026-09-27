	.include "macro.inc"

	.syntax unified

	thumb_func_start GetUnitItemUseReachBits
GetUnitItemUseReachBits: @ 0x08016F10
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r6, #0
	cmp r1, #0
	blt _08016F54
	lsls r0, r1, #1
	adds r1, r5, #0
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r4, [r1]
	adds r0, r5, #0
	adds r1, r4, #0
	bl CanUnitUseItem
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08016FC2
	movs r0, #0xff
	ands r0, r4
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08016F50 @ =0x08BE222C
	adds r1, r1, r0
	movs r6, #0xf
	ldrb r1, [r1, #0x19]
	ands r6, r1
	cmp r6, #0
	bne _08016F9E
	movs r6, #0x63
	b _08016F9E
	.align 2, 0
_08016F50: .4byte 0x08BE222C
_08016F54:
	movs r7, #0
	ldrh r4, [r5, #0x1e]
	cmp r4, #0
	beq _08016F9E
_08016F5C:
	adds r0, r5, #0
	adds r1, r4, #0
	bl CanUnitUseItem
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08016F8A
	movs r0, #0xff
	ands r0, r4
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08016FAC @ =0x08BE222C
	adds r1, r1, r0
	movs r4, #0xf
	ldrb r1, [r1, #0x19]
	ands r4, r1
	cmp r4, #0
	bne _08016F84
	movs r4, #0x63
_08016F84:
	cmp r6, r4
	bge _08016F8A
	adds r6, r4, #0
_08016F8A:
	adds r7, #1
	cmp r7, #4
	bgt _08016F9E
	lsls r1, r7, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _08016F5C
_08016F9E:
	cmp r6, #2
	beq _08016FBA
	cmp r6, #2
	bgt _08016FB0
	cmp r6, #1
	beq _08016FB6
	b _08016FC2
	.align 2, 0
_08016FAC: .4byte 0x08BE222C
_08016FB0:
	cmp r6, #0x63
	beq _08016FBE
	b _08016FC2
_08016FB6:
	movs r0, #1
	b _08016FC4
_08016FBA:
	movs r0, #3
	b _08016FC4
_08016FBE:
	movs r0, #0x20
	b _08016FC4
_08016FC2:
	movs r0, #0
_08016FC4:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
