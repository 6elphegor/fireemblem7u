	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08045448
sub_08045448: @ 0x08045448
	push {r4, r5, r6, r7, lr}
	ldr r6, _080454B4 @ =0x0203DC9C
	ldrb r0, [r6, #2]
	ldrb r1, [r6, #3]
	cmp r0, r1
	beq _080454AE
	ldr r7, _080454B8 @ =0x03001400
	adds r0, r1, r7
	ldrb r0, [r0]
	bl GetUnit
	adds r5, r0, #0
	ldrb r1, [r6, #2]
	adds r0, r1, r7
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	cmp r5, #0
	beq _0804547A
	bl EndAllMus
	adds r0, r5, #0
	bl ShowUnitSprite
_0804547A:
	cmp r4, #0
	beq _080454AE
	ldr r0, [r4, #0xc]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _080454AE
	ldrb r6, [r6, #2]
	adds r0, r6, r7
	ldrb r0, [r0]
	lsrs r1, r0, #6
	ldr r0, _080454BC @ =0x08B98AEC
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bne _080454AE
	adds r0, r4, #0
	bl StartMu
	bl DisableMuCamera
	adds r0, r4, #0
	bl HideUnitSprite
_080454AE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080454B4: .4byte 0x0203DC9C
_080454B8: .4byte 0x03001400
_080454BC: .4byte 0x08B98AEC
