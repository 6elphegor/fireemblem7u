	.include "macro.inc"

	.syntax unified

	thumb_func_start StartModeSelect
StartModeSelect: @ 0x080A867C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0809E9FC
	cmp r0, #7
	ble _080A8696
	ldr r0, _080A869C @ =0x08CE4930
	adds r1, r4, #0
	bl Proc_StartBlocking
	adds r0, #0x42
	movs r1, #1
	strb r1, [r0]
_080A8696:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A869C: .4byte 0x08CE4930
