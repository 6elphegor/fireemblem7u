	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B2DF8
sub_080B2DF8: @ 0x080B2DF8
	push {r4, r7, lr}
	sub sp, #8
	add r7, sp, #4
	str r0, [r7]
	movs r0, #0
	str r0, [sp]
	movs r0, #7
	movs r1, #9
	movs r2, #0x10
	movs r3, #6
	bl DrawUiFrame2
	movs r0, #0
	bl SetTextFont
	bl InitSystemTextFont
	ldr r4, _080B2E94 @ =0x02022EF0
	ldr r0, _080B2E98 @ =0x08CC26D4
	ldr r1, [r0]
	adds r0, r1, #0
	bl DecodeMsg
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl PutString
	ldr r0, _080B2E9C @ =0x02022EF8
	ldr r1, _080B2EA0 @ =0x0203A7F4
	ldr r3, [r1, #4]
	movs r2, #8
	ldrsb r2, [r3, r2]
	movs r1, #2
	bl PutNumber
	ldr r4, _080B2EA4 @ =0x02022F70
	ldr r0, _080B2EA0 @ =0x0203A7F4
	ldr r1, [r0, #4]
	ldr r0, [r1]
	ldrh r1, [r0]
	adds r0, r1, #0
	bl DecodeMsg
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl PutString
	ldr r4, _080B2EA8 @ =0x02022EFE
	ldr r0, _080B2EA0 @ =0x0203A7F4
	ldr r1, [r0, #4]
	ldr r0, [r1, #4]
	ldrh r1, [r0]
	adds r0, r1, #0
	bl DecodeMsg
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl PutString
	ldr r4, _080B2EAC @ =0x02022F7E
	ldr r0, _080B2EA0 @ =0x0203A7F4
	ldrh r1, [r0, #0x1c]
	adds r0, r1, #0
	bl GetItemName
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl PutString
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2E94: .4byte 0x02022EF0
_080B2E98: .4byte 0x08CC26D4
_080B2E9C: .4byte 0x02022EF8
_080B2EA0: .4byte 0x0203A7F4
_080B2EA4: .4byte 0x02022F70
_080B2EA8: .4byte 0x02022EFE
_080B2EAC: .4byte 0x02022F7E
