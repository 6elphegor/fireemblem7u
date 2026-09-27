	.include "macro.inc"

	.syntax unified

	thumb_func_start SomeLeftoverFunctionThatReturns0
SomeLeftoverFunctionThatReturns0: @ 0x0808DEA8
	adds r1, r0, #0
	ldr r0, _0808DEC4 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x2b
	bgt _0808DEEC
	cmp r0, #0x2a
	bge _0808DEE0
	cmp r0, #9
	beq _0808DEC8
	cmp r0, #0x29
	beq _0808DED4
	b _0808DEEC
	.align 2, 0
_0808DEC4: .4byte 0x0202BBF8
_0808DEC8:
	ldr r0, [r1]
	ldrb r0, [r0, #4]
	cmp r0, #0x23
	bne _0808DEEC
	movs r0, #1
	b _0808DEEE
_0808DED4:
	ldr r0, [r1]
	ldrb r0, [r0, #4]
	cmp r0, #0xb
	bne _0808DEEC
	movs r0, #1
	b _0808DEEE
_0808DEE0:
	ldr r0, [r1]
	ldrb r0, [r0, #4]
	cmp r0, #0x26
	bne _0808DEEC
	movs r0, #1
	b _0808DEEE
_0808DEEC:
	movs r0, #0
_0808DEEE:
	bx lr
