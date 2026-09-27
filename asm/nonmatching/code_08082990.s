	.include "macro.inc"

	.syntax unified

	thumb_func_start DrawHelpBoxSaveMenuLabels
DrawHelpBoxSaveMenuLabels: @ 0x08082990
	push {r4, lr}
	ldr r1, _080829DC @ =0x0202BBF8
	adds r1, #0x2b
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080829EC
	ldr r4, _080829E0 @ =0x0203E6B8
	movs r0, #0x88
	lsls r0, r0, #5
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #8
	bl Text_InsertDrawString
	ldr r0, _080829E4 @ =0x000012AF
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x38
	movs r2, #8
	bl Text_InsertDrawString
	ldr r0, _080829E8 @ =0x000010F2
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x70
	movs r2, #8
	bl Text_InsertDrawString
	b _08082A00
	.align 2, 0
_080829DC: .4byte 0x0202BBF8
_080829E0: .4byte 0x0203E6B8
_080829E4: .4byte 0x000012AF
_080829E8: .4byte 0x000010F2
_080829EC:
	ldr r4, _08082A08 @ =0x0203E6B8
	ldr r0, _08082A0C @ =0x00001290
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x10
	movs r2, #7
	bl Text_InsertDrawString
_08082A00:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08082A08: .4byte 0x0203E6B8
_08082A0C: .4byte 0x00001290
