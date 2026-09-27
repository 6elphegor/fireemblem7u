	.include "macro.inc"

	.syntax unified

	thumb_func_start StartXMapTransfer
StartXMapTransfer: @ 0x08042F98
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, _08042FDC @ =0x0203DA60
	bl SetTextFont
	bl InitSystemTextFont
	ldr r0, _08042FE0 @ =0x08B98AEC
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08042FF4
	ldr r1, _08042FE4 @ =0x03005E70
	ldr r0, _08042FE8 @ =0x0E007400
	ldr r4, _08042FEC @ =0x02000000
	movs r5, #0xc0
	lsls r5, r5, #4
	ldr r3, [r1]
	adds r1, r4, #0
	adds r2, r5, #0
	bl _call_via_r3
	ldr r2, _08042FF0 @ =DrawXMapSendProgress
	str r6, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl StartSioBigSend
	b _08042FFE
	.align 2, 0
_08042FDC: .4byte 0x0203DA60
_08042FE0: .4byte 0x08B98AEC
_08042FE4: .4byte 0x03005E70
_08042FE8: .4byte 0x0E007400
_08042FEC: .4byte 0x02000000
_08042FF0: .4byte DrawXMapSendProgress
_08042FF4:
	ldr r0, _08043008 @ =0x02000000
	ldr r1, _0804300C @ =DrawXMapReceiveProgress
	adds r2, r6, #0
	bl StartSioBigReceive
_08042FFE:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08043008: .4byte 0x02000000
_0804300C: .4byte DrawXMapReceiveProgress
