	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804BDAC
sub_0804BDAC: @ 0x0804BDAC
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0804BDC0
	movs r0, #0xe5
	lsls r0, r0, #2
	bl DoM4aSongNumStop
_0804BDC0:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1e
	ble _0804BDD6
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, _0804BDDC @ =sub_0804BDE0
	str r0, [r4, #0xc]
_0804BDD6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804BDDC: .4byte sub_0804BDE0
