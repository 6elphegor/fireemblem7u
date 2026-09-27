	.include "macro.inc"

	.syntax unified

	thumb_func_start UnitInfoWindow_DrawBase
UnitInfoWindow_DrawBase: @ 0x08031700
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r5, r0, #0
	str r1, [sp, #4]
	adds r6, r2, #0
	adds r7, r3, #0
	cmp r5, #0
	bne _08031724
	ldr r0, _08031814 @ =0x08B96998
	bl Proc_Find
	adds r5, r0, #0
	bl ClearUi
_08031724:
	ldr r0, [sp, #4]
	str r0, [r5, #0x2c]
	adds r0, r5, #0
	adds r0, #0x60
	movs r1, #0
	strb r6, [r0]
	adds r0, #1
	strb r7, [r0]
	adds r4, r7, #2
	ldr r3, [sp, #0x30]
	lsls r3, r3, #1
	adds r3, #2
	str r1, [sp]
	adds r0, r6, #0
	adds r1, r4, #0
	ldr r2, [sp, #0x2c]
	bl DrawUiFrame2
	lsls r0, r7, #5
	adds r0, r0, r6
	lsls r0, r0, #1
	ldr r1, _08031818 @ =0x02023460
	mov sb, r1
	add r0, sb
	ldr r1, _0803181C @ =0x08196084
	movs r2, #0x80
	lsls r2, r2, #5
	bl TmApplyTsa_thm
	mov r8, r4
	adds r4, r5, #0
	adds r4, #0x30
	movs r2, #0x63
	adds r2, r2, r5
	mov sl, r2
	adds r0, r7, #1
	str r0, [sp, #8]
	ldr r1, [sp, #0x2c]
	cmp r1, #0xa
	ble _080317C0
	adds r3, r6, #0
	adds r3, #0xa
	adds r0, r6, r1
	subs r2, r0, #1
	mov sb, r0
	cmp r3, r2
	bge _080317A0
	ldr r7, _08031820 @ =0x0000100B
	mov ip, r7
	lsls r1, r3, #1
	mov r7, r8
	lsls r0, r7, #6
	ldr r7, _08031818 @ =0x02023460
	adds r0, r0, r7
	adds r1, r1, r0
	subs r3, r2, r3
_08031794:
	mov r0, ip
	strh r0, [r1]
	adds r1, #2
	subs r3, #1
	cmp r3, #0
	bne _08031794
_080317A0:
	mov r2, r8
	lsls r1, r2, #5
	adds r0, r1, #0
	adds r0, #9
	adds r0, r0, r6
	lsls r0, r0, #1
	ldr r7, _08031818 @ =0x02023460
	adds r0, r0, r7
	ldr r2, _08031824 @ =0x00001026
	strh r2, [r0]
	subs r1, #1
	add r1, sb
	lsls r1, r1, #1
	adds r1, r1, r7
	ldr r0, _08031828 @ =0x0000100C
	strh r0, [r1]
_080317C0:
	adds r0, r4, #0
	bl ClearText
	adds r0, r5, #0
	bl sub_080316B8
	mov r0, sl
	ldrb r1, [r0]
	adds r0, r4, #0
	bl Text_SetCursor
	ldr r1, [sp, #4]
	ldr r0, [r1]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	ldr r2, [sp, #8]
	lsls r1, r2, #5
	adds r1, #3
	adds r1, r1, r6
	lsls r1, r1, #1
	ldr r0, _0803182C @ =0x02022C60
	adds r1, r1, r0
	adds r0, r4, #0
	bl PutText
	movs r0, #3
	bl EnableBgSync
	adds r0, r5, #0
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08031814: .4byte 0x08B96998
_08031818: .4byte 0x02023460
_0803181C: .4byte 0x08196084
_08031820: .4byte 0x0000100B
_08031824: .4byte 0x00001026
_08031828: .4byte 0x0000100C
_0803182C: .4byte 0x02022C60
