	.include "macro.inc"

	.syntax unified

	thumb_func_start ColorFadeSetupFromColorToWhite
ColorFadeSetupFromColorToWhite: @ 0x080025E4
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	adds r1, r7, #0
	strb r0, [r1]
	movs r0, #0x1f
	str r0, [r7, #4]
_080025F2:
	ldr r0, [r7, #4]
	cmp r0, #0
	bge _080025FA
	b _08002714
_080025FA:
	ldr r0, _08002620 @ =0x02022240
	ldr r1, [r7, #4]
	adds r0, r0, r1
	adds r1, r7, #0
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	movs r0, #0
	str r0, [r7, #8]
_08002618:
	ldr r0, [r7, #8]
	cmp r0, #0xf
	ble _08002624
	b _0800270C
	.align 2, 0
_08002620: .4byte 0x02022240
_08002624:
	ldr r0, _08002704 @ =0x02022260
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, [r7, #8]
	adds r1, r1, r2
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r0, r0, r2
	ldr r1, _08002708 @ =0x02022860
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #4
	ldr r3, [r7, #8]
	adds r2, r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	adds r1, r2, #0
	movs r2, #0x1f
	ands r1, r2
	adds r2, r1, #0
	adds r1, r2, #0
	adds r1, #0x20
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _08002704 @ =0x02022260
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, [r7, #8]
	adds r1, r1, r2
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r1, r2, #1
	adds r0, r0, r1
	ldr r1, _08002708 @ =0x02022860
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #4
	ldr r3, [r7, #8]
	adds r2, r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	lsrs r1, r2, #5
	adds r2, r1, #0
	movs r3, #0x1f
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	adds r1, r2, #0
	adds r1, #0x20
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _08002704 @ =0x02022260
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, [r7, #8]
	adds r1, r1, r2
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	adds r1, r2, #2
	adds r0, r0, r1
	ldr r1, _08002708 @ =0x02022860
	ldr r2, [r7, #4]
	adds r3, r2, #0
	lsls r2, r3, #4
	ldr r3, [r7, #8]
	adds r2, r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	lsrs r1, r2, #0xa
	adds r2, r1, #0
	movs r3, #0x1f
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	adds r1, r2, #0
	adds r1, #0x20
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	b _08002618
	.align 2, 0
_08002704: .4byte 0x02022260
_08002708: .4byte 0x02022860
_0800270C:
	ldr r0, [r7, #4]
	subs r1, r0, #1
	str r1, [r7, #4]
	b _080025F2
_08002714:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
