	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08091868
sub_08091868: @ 0x08091868
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r1, #0xa
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r4, _080918AC @ =0x02012A70
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	adds r0, #8
	bl ClearText
	ldr r0, _080918B0 @ =0x0000125C
	bl DecodeMsg
	adds r5, #0x42
	movs r1, #0
	str r1, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080918AC: .4byte 0x02012A70
_080918B0: .4byte 0x0000125C
