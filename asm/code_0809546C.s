	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809546C
sub_0809546C: @ 0x0809546C
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r4, _080954D8 @ =0x02012A80
	adds r0, r4, #0
	bl ClearText
	ldr r0, _080954DC @ =0x00001269
	bl DecodeMsg
	adds r1, r4, #0
	adds r4, #8
	ldr r5, _080954E0 @ =0x02023FC2
	movs r6, #0
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r1, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	adds r0, r4, #0
	bl ClearText
	ldr r0, _080954E4 @ =0x000010EE
	bl DecodeMsg
	adds r5, #0x82
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	ldr r0, _080954E8 @ =0x000010EF
	bl DecodeMsg
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0x20
	bl PutDrawText
	movs r0, #4
	bl EnableBgSync
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080954D8: .4byte 0x02012A80
_080954DC: .4byte 0x00001269
_080954E0: .4byte 0x02023FC2
_080954E4: .4byte 0x000010EE
_080954E8: .4byte 0x000010EF
