	.include "macro.inc"

	.syntax unified

	thumb_func_start AddItemToConvoy
AddItemToConvoy: @ 0x0802E790
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0802E7AC @ =0x0202BBB8
	movs r0, #0
	strh r0, [r1, #0x2e]
	movs r3, #0
	ldr r2, _0802E7B0 @ =0x0203A720
_0802E79E:
	ldrh r0, [r2]
	cmp r0, #0
	bne _0802E7B4
	strh r4, [r2]
	adds r0, r3, #0
	b _0802E7C2
	.align 2, 0
_0802E7AC: .4byte 0x0202BBB8
_0802E7B0: .4byte 0x0203A720
_0802E7B4:
	adds r2, #2
	adds r3, #1
	cmp r3, #0x63
	ble _0802E79E
	strh r4, [r1, #0x2e]
	movs r0, #1
	rsbs r0, r0, #0
_0802E7C2:
	pop {r4}
	pop {r1}
	bx r1
