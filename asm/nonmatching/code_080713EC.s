	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080713EC
sub_080713EC: @ 0x080713EC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _0807141C @ =0x02022C60
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	ldr r1, _08071420 @ =0x02023460
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	movs r0, #3
	bl EnableBgSync
	bl StartBattleManim
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807141C: .4byte 0x02022C60
_08071420: .4byte 0x02023460
