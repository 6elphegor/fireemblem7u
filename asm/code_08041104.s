	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08041104
sub_08041104: @ 0x08041104
	push {r4, r5, lr}
	adds r5, r0, #0
	bl ClearSioBG
	bl sub_08047B34
	bl sub_080490B4
	movs r0, #3
	bl EndFaceById
	ldr r4, _0804115C @ =0x0203D960
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
	ldr r0, _08041160 @ =0x00000785
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	ldr r1, _08041164 @ =0x02023F72
	adds r0, r4, #0
	bl PutText
	ldr r0, _08041168 @ =0x08B98BAC
	adds r1, r5, #0
	bl Proc_Start
	movs r0, #0
	movs r1, #0
	bl sub_08047BD4
	movs r0, #0xf
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804115C: .4byte 0x0203D960
_08041160: .4byte 0x00000785
_08041164: .4byte 0x02023F72
_08041168: .4byte 0x08B98BAC
