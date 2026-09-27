	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08099628
sub_08099628: @ 0x08099628
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r4, _08099678 @ =0x020129A8
	movs r0, #0
	bl SetTextFontGlyphs
	movs r0, #0
	bl SetTextFont
	movs r6, #0
	movs r5, #0x80
	ldr r7, _0809967C @ =0x08CC50C0
_08099640:
	adds r0, r4, #0
	bl ClearText
	ldm r7!, {r0}
	bl DecodeMsg
	adds r3, r4, #0
	adds r4, #8
	ldr r1, _08099680 @ =0x02023C68
	adds r1, r5, r1
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r3, #0
	movs r3, #0
	bl PutDrawText
	adds r5, #0x80
	adds r6, #1
	cmp r6, #4
	ble _08099640
	movs r0, #4
	bl EnableBgSync
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08099678: .4byte 0x020129A8
_0809967C: .4byte 0x08CC50C0
_08099680: .4byte 0x02023C68
