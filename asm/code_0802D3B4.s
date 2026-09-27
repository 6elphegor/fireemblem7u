	.include "macro.inc"

	.syntax unified

	thumb_func_start LockBmDisplay
LockBmDisplay: @ 0x0802D3B4
	push {lr}
	ldr r1, _0802D3E0 @ =0x0202BBB8
	ldrb r0, [r1, #2]
	adds r0, #1
	strb r0, [r1, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bgt _0802D3DC
	movs r0, #0
	bl SetOnHBlankB
	ldr r1, _0802D3E4 @ =0x02022860
	movs r0, #0
	strh r0, [r1]
	bl EnablePalSync
	movs r0, #1
	bl Proc_BlockEachMarked
_0802D3DC:
	pop {r0}
	bx r0
	.align 2, 0
_0802D3E0: .4byte 0x0202BBB8
_0802D3E4: .4byte 0x02022860
