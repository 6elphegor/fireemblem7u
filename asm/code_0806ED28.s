	.include "macro.inc"

	.syntax unified

	thumb_func_start InitManimActorFacings
InitManimActorFacings: @ 0x0806ED28
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	ldr r0, _0806ED5C @ =0x0203E0FC
	ldr r1, [r0, #4]
	adds r0, r1, #0
	adds r1, #0x4a
	ldrh r2, [r1]
	adds r0, r2, #0
	bl GetSpellAssocFacing
	lsls r1, r0, #0x18
	lsrs r0, r1, #0x18
	str r0, [r7]
	bl sub_0806EDAC
	ldr r1, _0806ED5C @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	cmp r0, #1
	beq _0806ED94
	cmp r0, #2
	beq _0806ED60
	b _0806EDA4
	.align 2, 0
_0806ED5C: .4byte 0x0203E0FC
_0806ED60:
	ldr r0, _0806EDA0 @ =0x0203A4F0
	ldrh r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0806ED8A
	movs r0, #2
	movs r1, #1
	ldr r2, [r7]
	bl sub_0806EC18
	movs r0, #3
	movs r1, #1
	ldr r2, [r7]
	bl sub_0806EC18
_0806ED8A:
	movs r0, #1
	movs r1, #0
	ldr r2, [r7]
	bl sub_0806EC18
_0806ED94:
	movs r0, #0
	movs r1, #1
	ldr r2, [r7]
	bl sub_0806EC18
	b _0806EDA4
	.align 2, 0
_0806EDA0: .4byte 0x0203A4F0
_0806EDA4:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
