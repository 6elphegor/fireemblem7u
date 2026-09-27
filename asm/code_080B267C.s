	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B267C
sub_080B267C: @ 0x080B267C
	push {r7, lr}
	mov r7, sp
	ldr r0, _080B269C @ =0x03004690
	ldr r1, [r0]
	adds r0, r1, #0
	bl ArenaBegin
	ldr r1, _080B26A0 @ =0x08CE729C
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B269C: .4byte 0x03004690
_080B26A0: .4byte 0x08CE729C
