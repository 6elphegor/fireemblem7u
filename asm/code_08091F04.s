	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08091F04
sub_08091F04: @ 0x08091F04
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	adds r6, r1, #0
	mov r8, r2
	adds r0, r6, #0
	movs r1, #0xa
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r4, _08091FFC @ =0x02012A70
	adds r0, r4, #0
	bl ClearText
	adds r7, r4, #0
	adds r7, #8
	adds r0, r7, #0
	bl ClearText
	bl PrepGetUnitAmount
	movs r5, #0
	cmp r0, #1
	bgt _08091F3C
	movs r5, #1
_08091F3C:
	ldr r0, _08092000 @ =0x0000125D
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	adds r2, r5, #0
	bl Text_InsertDrawString
	bl PrepGetUnitAmount
	movs r5, #0
	cmp r0, #1
	bgt _08091F5A
	movs r5, #1
_08091F5A:
	ldr r0, _08092004 @ =0x0000125E
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x20
	adds r2, r5, #0
	bl Text_InsertDrawString
	adds r1, r6, #0
	adds r1, #0x40
	adds r0, r4, #0
	bl PutText
	mov r0, r8
	bl sub_080912EC
	movs r4, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08091F86
	movs r4, #1
_08091F86:
	ldr r0, _08092008 @ =0x0000125F
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r7, #0
	movs r1, #0
	adds r2, r4, #0
	bl Text_InsertDrawString
	adds r5, r7, #0
	movs r4, #0
	mov r0, sb
	adds r0, #0x2b
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08091FBE
	mov r0, r8
	bl GetUnitItemCount
	cmp r0, #0
	ble _08091FBE
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08091FC0
_08091FBE:
	movs r4, #1
_08091FC0:
	movs r0, #0x93
	lsls r0, r0, #5
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x20
	adds r2, r4, #0
	bl Text_InsertDrawString
	ldr r4, _0809200C @ =0x02012A78
	adds r1, r6, #0
	adds r1, #0xc0
	adds r0, r4, #0
	bl PutText
	adds r4, #8
	movs r0, #0xa0
	lsls r0, r0, #1
	adds r1, r6, r0
	adds r0, r4, #0
	bl PutText
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08091FFC: .4byte 0x02012A70
_08092000: .4byte 0x0000125D
_08092004: .4byte 0x0000125E
_08092008: .4byte 0x0000125F
_0809200C: .4byte 0x02012A78
