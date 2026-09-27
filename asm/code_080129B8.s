	.include "macro.inc"

	.syntax unified

	thumb_func_start GC_PostLoadSuspend
GC_PostLoadSuspend: @ 0x080129B8
	push {lr}
	adds r2, r0, #0
	ldr r1, _080129D4 @ =0x0202BBF8
	movs r0, #0x80
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	beq _080129D8
	adds r0, r2, #0
	movs r1, #8
	bl Proc_Goto
	b _080129E0
	.align 2, 0
_080129D4: .4byte 0x0202BBF8
_080129D8:
	adds r0, r2, #0
	movs r1, #7
	bl Proc_Goto
_080129E0:
	pop {r0}
	bx r0
