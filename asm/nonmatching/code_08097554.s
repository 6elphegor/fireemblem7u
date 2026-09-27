	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08097554
sub_08097554: @ 0x08097554
	push {r4, lr}
	sub sp, #8
	ldr r4, _08097590 @ =0x02022CC8
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _08097594 @ =0x00001262
	bl DecodeMsg
	ldr r2, _08097598 @ =0x02012BE0
	movs r1, #0
	str r1, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	movs r0, #1
	bl EnableBgSync
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097590: .4byte 0x02022CC8
_08097594: .4byte 0x00001262
_08097598: .4byte 0x02012BE0
