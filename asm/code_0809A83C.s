	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809A83C
sub_0809A83C: @ 0x0809A83C
	adds r3, r0, #0
	ldr r2, _0809A844 @ =0x08CC52D8
	b _0809A864
	.align 2, 0
_0809A844: .4byte 0x08CC52D8
_0809A848:
	ldr r0, [r2]
	cmp r3, r0
	bne _0809A862
	cmp r1, #3
	ble _0809A856
	ldr r0, [r2, #4]
	b _0809A86C
_0809A856:
	cmp r1, #1
	ble _0809A85E
	ldr r0, [r2, #8]
	b _0809A86C
_0809A85E:
	ldr r0, [r2, #0xc]
	b _0809A86C
_0809A862:
	adds r2, #0x10
_0809A864:
	ldr r0, [r2]
	cmp r0, #0
	bne _0809A848
	movs r0, #0
_0809A86C:
	bx lr
	.align 2, 0
