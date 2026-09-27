	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807D644
sub_0807D644: @ 0x0807D644
	push {lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0807D674
	ldr r0, _0807D678 @ =0x08CBB47C
	movs r1, #0
	bl Proc_Start
	ldr r1, _0807D67C @ =0x0202BBB8
	movs r2, #0xc
	ldrsh r1, [r1, r2]
	str r1, [r0, #0x2c]
	ldr r0, _0807D680 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807D674
	ldr r0, _0807D684 @ =0x0000026A
	bl m4aSongNumStart
_0807D674:
	pop {r0}
	bx r0
	.align 2, 0
_0807D678: .4byte 0x08CBB47C
_0807D67C: .4byte 0x0202BBB8
_0807D680: .4byte 0x0202BBF8
_0807D684: .4byte 0x0000026A
