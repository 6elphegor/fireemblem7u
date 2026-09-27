	.include "macro.inc"

	.syntax unified

	thumb_func_start EventDarkenThenFunc_OnInit
EventDarkenThenFunc_OnInit: @ 0x0800B20C
	push {r4, lr}
	adds r4, r0, #0
	bl EventDarkenThenFunc_StartDarken
	adds r4, #0x64
	movs r0, #0x40
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
