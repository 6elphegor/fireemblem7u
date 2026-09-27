	.include "macro.inc"

	.syntax unified

	thumb_func_start XMapTransfer_AwaitCompletion
XMapTransfer_AwaitCompletion: @ 0x08043010
	push {lr}
	bl IsSioBigTransferActive
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08043020
	movs r0, #1
	b _08043052
_08043020:
	ldr r0, _08043058 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08043032
	movs r0, #0x7e
	bl m4aSongNumStart
_08043032:
	bl InitTalkTextFont
	ldr r0, _0804305C @ =0x08B98AEC
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08043050
	ldr r0, _08043060 @ =0x02000000
	ldr r1, _08043064 @ =0x0E007400
	movs r2, #0xc0
	lsls r2, r2, #4
	bl WriteAndVerifySramFast
_08043050:
	movs r0, #0
_08043052:
	pop {r1}
	bx r1
	.align 2, 0
_08043058: .4byte 0x0202BBF8
_0804305C: .4byte 0x08B98AEC
_08043060: .4byte 0x02000000
_08043064: .4byte 0x0E007400
