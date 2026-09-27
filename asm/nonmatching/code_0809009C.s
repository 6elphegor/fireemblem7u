	.include "macro.inc"

	.syntax unified

	thumb_func_start GetPrepMenuItemAmt
GetPrepMenuItemAmt: @ 0x0809009C
	push {lr}
	ldr r0, _080900AC @ =0x08CC416C
	bl Proc_Find
	cmp r0, #0
	bne _080900B0
	movs r0, #0
	b _080900B4
	.align 2, 0
_080900AC: .4byte 0x08CC416C
_080900B0:
	adds r0, #0x2b
	ldrb r0, [r0]
_080900B4:
	pop {r1}
	bx r1
