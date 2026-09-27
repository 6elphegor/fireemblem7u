	.include "macro.inc"

	.syntax unified

	thumb_func_start BmMain_UpdateTraps
BmMain_UpdateTraps: @ 0x08015458
	push {lr}
	adds r1, r0, #0
	ldr r0, _08015474 @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	cmp r0, #0x40
	bne _0801547C
	ldr r0, _08015478 @ =0x08B94578
	bl Proc_StartBlocking
	bl DecayTraps
	movs r0, #0
	b _0801547E
	.align 2, 0
_08015474: .4byte 0x0202BBF8
_08015478: .4byte 0x08B94578
_0801547C:
	movs r0, #1
_0801547E:
	pop {r1}
	bx r1
	.align 2, 0
