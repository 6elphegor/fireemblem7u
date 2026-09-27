	.include "macro.inc"

	.syntax unified

	thumb_func_start StartBmVSync
StartBmVSync: @ 0x0802D380
	push {lr}
	ldr r0, _0802D39C @ =0x08B96158
	movs r1, #0
	bl Proc_Start
	bl BmVSync_AnimInit
	bl WeatherInit
	ldr r1, _0802D3A0 @ =0x0202BBB8
	movs r0, #0
	strb r0, [r1, #2]
	pop {r0}
	bx r0
	.align 2, 0
_0802D39C: .4byte 0x08B96158
_0802D3A0: .4byte 0x0202BBB8
