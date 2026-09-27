	.include "macro.inc"

	.syntax unified

	thumb_func_start ArenaGenerateOpposingClassId
ArenaGenerateOpposingClassId: @ 0x0802EB18
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r6, #0
	mov r8, r6
	cmp r0, #7
	bhi _0802EB6C
	lsls r0, r0, #2
	ldr r1, _0802EB30 @ =_0802EB34
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802EB30: .4byte _0802EB34
_0802EB34: @ jump table
	.4byte _0802EB54 @ case 0
	.4byte _0802EB54 @ case 1
	.4byte _0802EB54 @ case 2
	.4byte _0802EB5C @ case 3
	.4byte _0802EB6C @ case 4
	.4byte _0802EB68 @ case 5
	.4byte _0802EB68 @ case 6
	.4byte _0802EB68 @ case 7
_0802EB54:
	ldr r0, _0802EB58 @ =0x08B9629C
	b _0802EB6A
	.align 2, 0
_0802EB58: .4byte 0x08B9629C
_0802EB5C:
	ldr r1, _0802EB64 @ =0x08B962ED
	mov r8, r1
	b _0802EB6C
	.align 2, 0
_0802EB64: .4byte 0x08B962ED
_0802EB68:
	ldr r0, _0802EBB4 @ =0x08B962C2
_0802EB6A:
	mov r8, r0
_0802EB6C:
	ldr r0, _0802EBB8 @ =0x0203A7F4
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r0, [r0, #4]
	ldr r5, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r5, r0
	movs r0, #0x80
	lsls r0, r0, #1
	ands r5, r0
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, #0
	beq _0802EBA6
	mov r4, r8
_0802EB8A:
	ldrb r0, [r4]
	bl GetClassData
	ldr r0, [r0, #0x28]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, r5
	bne _0802EB9E
	adds r6, #1
_0802EB9E:
	adds r4, #1
	ldrb r0, [r4]
	cmp r0, #0
	bne _0802EB8A
_0802EBA6:
	adds r0, r6, #0
	bl RandNext
	adds r7, r0, #0
	movs r6, #0
	mov r4, r8
	b _0802EBC0
	.align 2, 0
_0802EBB4: .4byte 0x08B962C2
_0802EBB8: .4byte 0x0203A7F4
_0802EBBC:
	adds r6, #1
_0802EBBE:
	adds r4, #1
_0802EBC0:
	ldrb r0, [r4]
	bl GetClassData
	ldr r0, [r0, #0x28]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, r5
	bne _0802EBBE
	cmp r6, r7
	bne _0802EBBC
	ldrb r0, [r4]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
